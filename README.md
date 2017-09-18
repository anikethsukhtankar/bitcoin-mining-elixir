# Bitcoin Mining using Elixir 

COP5615 - Distributed Operating Systems Principles Project 1

The goal of this project is to use Elixir and the actor model to build a good solution to the bitcoin mining problem that runs well on multi-core machines.

## Authors

* **Shikha Mehta** - *UF ID: 4851 9256* - [Github](https://github.com/Shikha2410)
* **Aniketh Sukhtankar** - *UF ID: 7819 9584* - [Github](https://github.com/anikethsukhtankar)

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
   real -> 2m50.530s
   user -> 6m35.256s
   sys  -> 3m41.872s
```

## Coin with most zeroes (7) : 

```elixir
asukhtankarfvvgdssixg   000000036115cffa23dfb4a961224471cea9bdeba989893125e848e3bee98a51
```

## Largest number of working machines on which the code was run

The code was simultaneously run on 8 machines with one functioning as server and the other 7 as workers.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes. 

### Prerequisites

#### Erlang

Please use Erlang >= 20.0, available at <https://www.erlang.org/downloads>.

#### Elixir

To install elixir on a Mac, `brew install elixir` (you may need to `brew update` first).

Alternatively, you can follow [these instructions](http://elixir-lang.org/install.html).

### Running

#### App setup

    $ mix escript.build

This will install all needed packages and build the project1 application file.

#### Run the app on server

    $ escript project1 <k>
    
    eg. escript project1 4

Starts the app, passing in the k value while the console begins printing on independent lines, the input string and the corresponding SHA256 hash separated by a TAB, for each of the bitcoins found that meet the criteria. The input string has been prefixed by the gatorlink ID "asukhtankar" as per the requirement mentioned.

#### Run the app on a worker

    $ escript project1 <server-ip>
    
    eg. escript project1 10.22.13.155

The worker logic is invoked when the argument passed to project1 is a computer address or IP address of a server. This program then becomes a “worker” and contacts the server to get work. This second program will not display anything. All the coins found are displayed by the server. For eg. the above command will start a worker that contacts the elixir server hosted at 10.22.13.155 and participates into mining.The server is able to mine coins without any workers and accommodates multiple workers dynamically as they become available.


## Built With

* [Elixir](https://elixir-lang.org/) - Elixir is a dynamic, functional language designed for building scalable and maintainable applications.
* [Visual Studio Code](https://code.visualstudio.com/) - Code Editor
* [Github](https://github.com/anikethsukhtankar/bitcoin-mining-elixir/) - Dependency Management

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `project1` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:project1, "~> 0.1.0"}
  ]
end
```

