defmodule BitcoinMining.Server do
    
    def process(parameter) do
        try do
            unless Node.alive?() do
                {:ok,iflist}=:inet.getif()
                [head | tail] = Enum.reverse(iflist)
                {ip_tuple,_,_} = head
                current_ip = to_string(:inet_parse.ntoa(ip_tuple))
                if current_ip === "127.0.0.1" do
                    {ip_tuple,_,_} = hd(tail)
                    current_ip = to_string(:inet_parse.ntoa(ip_tuple))
                end
                server_node_name = String.to_atom("server@" <> current_ip)
                Node.start(server_node_name)
                Node.set_cookie(server_node_name,:monster)
            end
        rescue
	        _ -> IO.puts "An error occurred while making server node distributed."
        end
        k=String.to_integer(hd(parameter))
        server_id=spawn_link(fn() -> server_print() end)
        
        # {:ok, pid} = Task.Supervisor.start_link()
        # for _ <- 1..100 do
        #     Task.Supervisor.async(pid,fn() -> miner(server_id,k) end)
        # end
        
        empty?(Node.list)
        Node.spawn_link(List.last(Node.list()),fn() -> miner(server_id,k) end)       
        receive do: (_ -> :ok)
    end

    def empty?([]) do
        empty?(Node.list)
    end
    def empty?(list) when is_list(list) do 
        nil
    end

    def server_print() do
      receive do
	      msg -> IO.puts msg
      end
      server_print()
    end

    def miner(s_id,k) do
      msgt = "asukhtankar" <> randomizer()
      temp = :crypto.hash(:sha256, msgt) |> Base.encode16 |> String.downcase
      if(String.slice(temp,0,k) === String.duplicate("0",k)) do
        send(s_id, msgt <> "\t" <> temp)
      end
      miner(s_id,k)
    end
    
    def randomizer do
      :crypto.strong_rand_bytes(10) |> Base.url_encode64 |> binary_part(0, 10) |> String.downcase
    end

  end