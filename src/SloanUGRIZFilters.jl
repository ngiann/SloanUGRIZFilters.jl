module SloanUGRIZFilters

    using DelimitedFiles, Interpolations, LinearAlgebra, QuadGK


    function instantiate_filter(filename, normalise = false)

        local data = readdlm(joinpath(joinpath(dirname(pathof(SloanUGRIZFilters)), "filters"), filename))

        extrap = linear_interpolation(data[:,1], data[:,2], extrapolation_bc = 0)

        Z = normalise ? quadgk(λ -> λ * extrap(λ), 0, 11230.00)[1] : 1.0

        λ -> (λ * extrap(λ)) / Z

    end

   
    # Define normalised filters

    filter_u = instantiate_filter("SLOAN_SDSS.u.dat")
    
    filter_g = instantiate_filter("SLOAN_SDSS.g.dat")
    
    filter_r = instantiate_filter("SLOAN_SDSS.r.dat")
    
    filter_i = instantiate_filter("SLOAN_SDSS.i.dat")

    filter_z = instantiate_filter("SLOAN_SDSS.z.dat")

    # Define non-normalised filters

    filter_u_orig = instantiate_filter("SLOAN_SDSS.u.dat", false)
    
    filter_g_orig = instantiate_filter("SLOAN_SDSS.g.dat", false)
    
    filter_r_orig = instantiate_filter("SLOAN_SDSS.r.dat", false)
    
    filter_i_orig = instantiate_filter("SLOAN_SDSS.i.dat", false)

    filter_z_orig = instantiate_filter("SLOAN_SDSS.z.dat", false)


    # Define fold with filters

    # fold_u(λ, y) = dot(filter_u(λ), y)
    
    # fold_g(λ, y) = dot(filter_g(λ), y)

    # fold_r(λ, y) = dot(filter_r(λ), y)
    
    # fold_i(λ, y) = dot(filter_i(λ), y)
    
    # fold_z(λ, y) = dot(filter_z(λ), y)


    export filter_u, filter_g, filter_r, filter_i, filter_z
    export filter_u_orig, filter_g_orig, filter_r_orig, filter_i_orig, filter_z_orig

    # export fold_u, fold_g, fold_r, fold_i, fold_z

    include("createFilterMatrix.jl")

    export createFilterMatrix
    
end
