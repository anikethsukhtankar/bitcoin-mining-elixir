defmodule BitcoinMining.Worker do
 
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
                current_ip = "192.168.0.2"
                worker_node_name = String.to_atom("worker@" <> current_ip)
                Node.start(worker_node_name)
                Node.set_cookie(worker_node_name,:monster)
            end
        rescue
	        _ -> IO.puts "An error occurred while making worker node distributed."
        end
        Node.connect(String.to_atom("server@" <> hd(parameter)))
        receive do: (_ -> :ok)
    end

  end