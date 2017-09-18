defmodule BitcoinMining.Worker do
 
    def process(parameter) do
        {:ok,iflist}=:inet.getif()
        make_distributed(Enum.reverse(iflist),length(iflist))
        
        Node.connect(String.to_atom("server@" <> hd(parameter)))
        receive do: (_ -> :ok)
    end

    def make_distributed([head | tail],l) do
        unless Node.alive?() do
            try do
                {ip_tuple,_,_} = head
                current_ip = to_string(:inet_parse.ntoa(ip_tuple))
                if current_ip === "127.0.0.1" do
                    if l != 1 do
                        make_distributed(tail,l-1)
                    end
                else
                    server_node_name = String.to_atom("worker@" <> current_ip)
                    Node.start(server_node_name)
                    Node.set_cookie(server_node_name,:monster)
                end
            rescue
                _ -> if l != 1, do: make_distributed(tail,l-1), else: IO.puts "Could not make current node distributed."
            end
        end
    end

  end
