#Havel-Hakimi Algorithm
function isGraphical(seq)
    Seq = copy(seq)
    graphical = true
    subSeqs = []
    push!(subSeqs,copy(Seq))
    sort!(Seq,rev=true)
    while sum(Seq) > 0
        max = popfirst!(Seq)
        if max > length(Seq)
            graphical = false; break;
        end
        Seq[1:max] = Seq[1:max].-1
        sort!(Seq,rev=true)
        push!(subSeqs,copy(Seq))
        if any(x->x<0,Seq) #If seq contains a negative value
            graphical = false; break;
        end
    end
    return (graphical,Vector{Array{Int64,1}}(subSeqs))
end
