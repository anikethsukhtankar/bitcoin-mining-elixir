defmodule BitcoinMining.Main do
    def main(args) do
      args |> parse_args |> delegate
    end

    defp parse_args(args) do
      {_,parameter,_} = OptionParser.parse(args)
      parameter
    end
    
    def delegate([]) do
      IO.puts "No argument given"
    end

    def delegate(parameter) do
      if not String.contains?(hd(parameter),".") do
        BitcoinMining.Server.process(parameter)
      else
        BitcoinMining.Worker.process(parameter)
      end
    end

end