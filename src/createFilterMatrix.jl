function createFilterMatrix(λrange)

    Matrix([filter_u(λrange) filter_g(λrange) filter_r(λrange) filter_i(λrange)  filter_z(λrange)]')

end