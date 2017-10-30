local metric = {
    ['ppm'] = {
        ['name'] = {
            ['singular'] = 'Part-per Million',
            ['plural'] = 'Parts-per Million'
        },
        ['to_anchor'] = 1
    },
    ['ppb'] = {
        ['name'] = {
            ['singular'] = 'Part-per Billion',
            ['plural'] = 'Parts-per Billion'
        },
        ['to_anchor'] = 0.001
    },
    ['ppt'] = {
        ['name'] = {
            ['singular'] = 'Part-per Trillion',
            ['plural'] = 'Parts-per Trillion'
        },
        ['to_anchor'] = 0.000001
    },
    ['ppq'] = {
        ['name'] = {
            ['singular'] = 'Part-per Quadrillion',
            ['plural'] = 'Parts-per Quadrillion'
        },
        ['to_anchor'] = 0.000000001
    }
}

return {
    ['metric'] = metric,
    ['imperial'] = {},
    ['_anchors'] = {
        ['metric'] = {
            ['unit'] = 'ppm',
            ['ratio'] = 0.000001
        }
    }
}