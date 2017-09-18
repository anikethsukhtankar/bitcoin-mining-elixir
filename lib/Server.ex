defmodule BitcoinMining.Server do
    
    def process(parameter) do
        {:ok,iflist}=:inet.getif()
        make_distributed(Enum.reverse(iflist),length(iflist))
        k=String.to_integer(hd(parameter))
        server_id=spawn_link(fn() -> server_print(k) end)
        :global.register_name(:serve,server_id)
        {:ok, pid} = Task.Supervisor.start_link()
        logproc = 2*System.schedulers_online()
        for _ <- 1..logproc do
            Task.Supervisor.async(pid,fn() -> miner(server_id,k) end)
        end
        receive do: (_ -> :ok)
    end

    def make_distributed([head | tail],l) do
        unless Node.alive?() do
            try do
                {ip_tuple,_,_} = head
                current_ip = to_string(:inet_parse.ntoa(ip_tuple))
                if current_ip === "127.0.0.1" do
                    if l > 1 do
                        make_distributed(tail,l-1)
                    else 
                        IO.puts "Could not make current node distributed."
                    end
                else
                    server_node_name = String.to_atom("server@" <> current_ip)
                    Node.start(server_node_name)
                    Node.set_cookie(server_node_name,:monster)
                end
            rescue
                _ -> if l > 1, do: make_distributed(tail,l-1), else: IO.puts "Could not make current node distributed."
            end
        end
    end
    
    def server_print(k) do
      receive do
          {:getk,client} -> send(client, {:sendk,k})
	      msg -> IO.puts msg
      end
      server_print(k)
    end

    def miner(s_id,k) do
      msgt = "asukhtankar" <> randomizer(9)
      temp = :crypto.hash(:sha256, msgt) |> Base.encode16 |> String.downcase
      if(String.slice(temp,0,k) === String.duplicate("0",k)) do
        send(s_id, msgt <> "\t" <> temp)
      end
      miner(s_id,k)
    end
    
    def randomizer(l) do
      :crypto.strong_rand_bytes(l) |> Base.url_encode64 |> binary_part(0, l) |> String.downcase
    end

  end
