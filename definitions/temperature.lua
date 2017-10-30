local metric = {
    ['C'] = {
        ['name'] = {
            ['singular'] = 'degree Celsius',
            ['plural'] = 'degrees Celsius'
        },
        ['to_anchor'] = 1,
        ['anchor_shift'] = 0
    },
    ['K'] = {
        ['name'] = {
            ['singular'] = 'degree Kelvin',
            ['plural'] = 'degrees Kelvin'
        },
        ['to_anchor'] = 1,
        ['anchor_shift'] = 273.15
    }
}

local imperial = {
    ['F'] = {
        ['name'] = {
            ['singular'] = 'degree Fahrenheit',
            ['plural'] = 'degrees Fahrenheit'
        },
        ['to_anchor'] = 1
    },
    ['R'] = {
        ['name'] = {
            ['singular'] = 'degree Rankine',
            ['plural'] = 'degrees Rankine'
        },
        ['to_anchor'] = 1,
        ['anchor_shift'] = 459.67
    }
}

local celsius_to_fahrenheit = function(c)
    return c / (5 / 9) + 32
end

local fahrenheit_to_celsius = function(f)
    return (f - 32) * (5 / 9)
end

return {
    ['metric'] = metric,
    ['imperial'] = imperial,
    ['_anchors'] = {
        ['metric'] = {
            ['unit'] = 'C',
            ['transform'] = celsius_to_fahrenheit
        },
        ['imperial'] = {
            ['unit'] = 'F',
            ['transform'] = fahrenheit_to_celsius
        }
    }
}