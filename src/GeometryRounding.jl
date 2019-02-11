geom_sigdigits(::Type{Int64})::Int = 12
geom_sigdigits(::Type{Float32})::Int = 6
geom_sigdigits(::Type{Float64})::Int = 12

geom_atol_zero(::Type{Int64})::Float64 = 1e-12
geom_atol_zero(::Type{Float32})::Float32 = 1e-9
geom_atol_zero(::Type{Float64})::Float64 = 1e-12

function geom_round(v::T)::T where {T}
    return isapprox(v, 0, atol = geom_atol_zero(T)) ? T(0) : round(v, sigdigits = geom_sigdigits(T))
end
function geom_round(cyl::Cylindrical{T})::Cylindrical{T} where T
    return Cylindrical{T}(geom_round(cyl.r),geom_round(cyl.θ),geom_round(cyl.z))
end
