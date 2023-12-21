module Day04
using AdventOfCode2023

function day04(input::String = readInput(joinpath(@__DIR__,"..","data","day04.txt")))
        data = parseInput(input)
        t1 = Task1(data);
        return t1;
end

function parseInput(input)
        data = Dict{Int,Vector{Any}}()
    for line in split(rstrip(input),"\n")
        # print(line,"\n")
        card,gdata = split(line,":")
        card_id = parse(Int,last(split(card," ")))
        v1,v2 = split(gdata,"|")
        vec_1 = parse.(Int,filter(!isempty,split(v1," ")));
        vec_2 = parse.(Int,filter(!isempty,split(v2," ")));
        v = []
        push!(v,(vec_1,vec_2))
        data[card_id] = v
    end;
end

function Task1(data::Dict{Int,Vector{Any}})
    sum = 0;
    for k ∈ keys(data)
        flag = false;
        counter = 0;
        for v ∈ values(data[k])[1][1]
            if v ∈ values(data[k])[1][2]
                if flag == false    #first one
                    counter = 1;
                    flag = true;
                else
                    counter = counter *2;
                end;
            end;
        end;
        println(counter)
        sum += counter;
    end;

    return sum;
end;
end;  # module day04