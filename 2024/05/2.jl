rs, ps = split(read("input", String), "\n\n") |>
           i -> (Set(map(r -> parse.(Int, split(r,'|')), split(i[1]))),
                 map(p -> parse.(Int, split(p,',')), split(i[2])))
isvalid(p) = all(all([p[i],p[j]] ∉ rs for j ∈ 1:i-1) for i ∈ 1:length(p))
correct(p) = sort(p, lt = (a,b) -> a==b || [a,b] ∈ rs)
middle(p) = p[ceil(Int, length(p)/2)]
println(sum(!isvalid(p) * middle(correct(p)) for p ∈ ps))
