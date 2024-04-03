module SloanUGRIZFilters

    using DelimitedFiles, Interpolations, LinearAlgebra, QuadGK


    function instantiate_filter(filename)

        local data = readdlm(joinpath(joinpath(dirname(pathof(SloanUGRIZFilters)), "filters"), filename))

        extrap = linear_interpolation(data[:,1], data[:,2], extrapolation_bc = 0)

        Z = quadgk(λ -> λ * extrap(λ), 0, 11230.00)[1]

        x -> extrap(x) / Z # normalised filter❗

    end

   
    # Define filters

    filter_u = instantiate_filter("SLOAN_SDSS.u.dat")
    
    filter_g = instantiate_filter("SLOAN_SDSS.g.dat")
    
    filter_r = instantiate_filter("SLOAN_SDSS.r.dat")
    
    filter_i = instantiate_filter("SLOAN_SDSS.i.dat")

    filter_z = instantiate_filter("SLOAN_SDSS.z.dat")


    # Define fold with filters

    # fold_u(λ, y) = dot(filter_u(λ), y)
    
    # fold_g(λ, y) = dot(filter_g(λ), y)

    # fold_r(λ, y) = dot(filter_r(λ), y)
    
    # fold_i(λ, y) = dot(filter_i(λ), y)
    
    # fold_z(λ, y) = dot(filter_z(λ), y)


    export filter_u, filter_g, filter_r, filter_i, filter_z

    # export fold_u, fold_g, fold_r, fold_i, fold_z

    include("createFilterMatrix.jl")

    export createFilterMatrix
    
end
