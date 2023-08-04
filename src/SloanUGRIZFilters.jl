module SloanUGRIZFilters

    using DelimitedFiles, Interpolations, QuadGK


    function instantiate_filter(filename)

        local data = readdlm(joinpath(joinpath(dirname(pathof(SloanUGRIZFilters)), "filters"), filename))

        extrap = linear_interpolation(data[:,1], data[:,2], extrapolation_bc = 0)

        Z = quadgk(extrap, 0, 11000.00)[1]

        x -> extrap(x) / Z # normalised filter❗

    end


    filter_u = instantiate_filter("SLOAN_SDSS.u.dat")
    
    filter_g = instantiate_filter("SLOAN_SDSS.g.dat")
    
    filter_r = instantiate_filter("SLOAN_SDSS.r.dat")
    
    filter_i = instantiate_filter("SLOAN_SDSS.i.dat")

    filter_z = instantiate_filter("SLOAN_SDSS.z.dat")

    export filter_u, filter_g, filter_r, filter_i, filter_z

end
