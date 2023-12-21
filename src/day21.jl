module Day21
using AdventOfCode2023

function day21(input::String = readInput(joinpath(@__DIR__,"..","data","day21.txt")))
    data = parseInput(input)
    t1 = Task1(data)
#    t2 = Task2(data)
    return t1;  #t1 = 3639
end;

function parseInput(input) # matrix |-1 = S|0 = .|1 = #|
    data = Matrix{Int8}(undef,size(split(rstrip(input),"\n"),1),round(Int,(length(input)/size(split(rstrip(input),"\n"),1)-1))) # fix
    lcount = 1;
    for line ∈ split(rstrip(input),"\n")
        vtemp = zeros(Int8,length(line))
        for i ∈ 1:length(line)
            if line[i] == '.'
                vtemp[i] = 0;
            elseif line[i] == '#'
                vtemp[i] = 1;
            elseif line[i] == 'S'
                vtemp[i] = -1;
            end;
        end;
        data[lcount,:] = transpose(vtemp);
        lcount +=1;
    end;
    return data;
end;

function Task1(data::Matrix{Int8})
    maxSteps = 64;
    inreach = 0;
    idx = findall(x-> (x==-1), data)
    pos_S = (idx[1][1], idx[1][2]);
    inreach = FindStep(data,maxSteps,[pos_S])
    return inreach;
end;

function FindStep(data::Matrix{Int8},maxSteps::Int,reached::Vector{Tuple{Int,Int}})
# for speed I have replaced size(data,1/2) with problem specific- 131!
    for remSteps ∈ 1:maxSteps
        reached_new = []
        for gplt ∈ reached
            for (i,j) ∈ [(-1,0),(0,+1),(+1,0),(0,-1)]
                if (gplt[1]+i ∈ 1:131) && (gplt[2]+j ∈ 1:131) && ((gplt[1]+i, gplt[2]+j) ∉ reached_new)
                    if (data[gplt[1]+i,gplt[2]+j] != 1)
                        push!(reached_new, (gplt[1]+i, gplt[2]+j))
                    end;
                end;
            end;
        end;
        reached = reached_new;
    end;
return size(reached,1);
end;

end; # module Day21