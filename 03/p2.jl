include(joinpath(Base.source_dir(), "common.jl"))

function getrightbits(isoxygen::Bool)
    cfile = copy(file)
    i = 1
    while length(cfile) > 1
        bits = map(l -> l[i], cfile)
        n_one = length(bits[bits.=='1'])
        filterchar = (n_one >= length(cfile) / 2) == isoxygen ? '1' : '0'
        filter!(l -> l[i] == filterchar, cfile)

        i += 1
    end

    return cfile[1]
end

oxygen = bitstoint(getrightbits(true))
co2 = bitstoint(getrightbits(false))

println("oxygen and co2 report: $(oxygen * co2)")