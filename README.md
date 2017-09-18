# Bitcoin Mining using Elixir 

COP5615 - Distributed Operating Systems Principles Project 1

Group Members : Shikha Mehta, Aniketh Sukhtankar (UF ID 7819 9584)

The goal of this project is to use Elixir and the actor model to build a good solution to the bitcoin mining problem that runs well on multi-core machines.


## Size of the work unit 

The size of work unit handled by every worker process as well as the main server process varies dynamically with the number of logical processors available to the program which is determined using the command System.schedulers_online().

## Sample Output

The following output was generated for command ./project1 4
```elixir
asukhtankarbweo0yjers   0000997c5f2ce5350e4f477f8a92241d13702ba5ceb0912d31cbb2b740e6bc83
asukhtankaro8jte89knr   00000931828e4579624bc583eee55c63818d209a173dfc77e8e63f69db6cdb17
asukhtankard6zc_v9l2t   00009c77fecec0f76a5907ef53759f727ba120792098498e1297987a179ec2d1
asukhtankar0z2c0nnyw5   000070e39a3f4d2b7554ed2dc2e6dc45621499d60cf9a0b5a5f18c86c07d2431
asukhtankaruhkmdgxs9_   000078b0df1c217cdcb76c5969ca454ef85b5a429bbf5ba7174a060829238a17
```

## Running Time

```elixir
   real -> 0m36.472s
   user -> 2m16.925s
   syst -> 0m1.725s
```

## Coin with most zeroes (7) : 

```elixir
asukhtankarfvvgdssixg   000000036115cffa23dfb4a961224471cea9bdeba989893125e848e3bee98a51
```

## Largest number of working machines on which the code was run

The code was simultaneously run on 4 machines with one functioning as server and the other 3 as workers.

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `bitcoinmining` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:bitcoinmining, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/bitcoinmining](https://hexdocs.pm/bitcoinmining).

