local units = {}

units.measures = {
    ['length'] = dofile('definitions/length.lua'),
    ['area'] = dofile('definitions/area.lua'),
    ['mass'] = dofile('definitions/mass.lua'),
    ['volume'] = dofile('definitions/volume.lua'),
    ['each'] = dofile('definitions/each.lua'),
    ['temperature'] = dofile('definitions/temperature.lua'),
    ['time'] = dofile('definitions/time.lua'),
    ['digital'] = dofile('definitions/digital.lua'),
    ['parts-per'] = dofile('definitions/parts_per.lua'),
    ['speed'] = dofile('definitions/speed.lua'),
    ['pressure'] = dofile('definitions/pressure.lua'),
    ['current'] = dofile('definitions/current.lua'),
    ['voltage'] = dofile('definitions/voltage.lua'),
    ['power'] = dofile('definitions/power.lua'),
    ['reactive-power'] = dofile('definitions/reactive_power.lua'),
    ['apparent-power'] = dofile('definitions/apparent_power.lua'),
    ['energy'] = dofile('definitions/energy.lua'),
    ['reactive-energy'] = dofile('definitions/reactive_energy.lua'),
    ['volume-flow-rate'] = dofile('definitions/volume_flow_rate.lua')
}

function units.convert(amount, from, to)
    if from == to then
        return amount, true
    elseif tonumber(amount) == nil then
        return false, '"amount" must be a number!'
    end
    amount = tonumber(amount)
    from = {
        ['unit'] = from,
        ['type'] = false,
        ['measure'] = false,
        ['_anchors'] = {}
    }
    to = {
        ['unit'] = to,
        ['type'] = false,
        ['measure'] = false,
        ['_anchors'] = {}
    }
    for measure_type, measure in pairs(units.measures) do
        from['_anchors'] = measure['_anchors']
        to['_anchors'] = measure['_anchors']
        for unit_type, unit in pairs(measure) do
            local count = 0
            for k, v in pairs(unit) do
                count = count + 1
            end
            if unit_type == 'metric' and count >= 1 then
                for k, v in pairs(unit) do
                    if from['unit'] == k:lower() or from['unit'] == v['name']['singular']:lower() or from['unit'] == v['name']['plural']:lower() then
                        from['type'] = 'metric'
                        from['measure'] = measure_type
                        from['unit'] = v
                    end
                    if to['unit'] == k:lower() or to['unit'] == v['name']['singular']:lower() or to['unit'] == v['name']['plural']:lower() then
                        to['type'] = 'metric'
                        to['measure'] = measure_type
                        to['unit'] = v
                    end
                end
            elseif unit_type == 'imperial' and count >= 1 then
                for k, v in pairs(unit) do
                    if from['unit'] == k:lower() or from['unit'] == v['name']['singular']:lower() or from['unit'] == v['name']['plural']:lower() then
                        from['type'] = 'imperial'
                        from['measure'] = measure_type
                        from['unit'] = v
                    end
                    if to['unit'] == k:lower() or to['unit'] == v['name']['singular']:lower() or to['unit'] == v['name']['plural']:lower() then
                        to['type'] = 'imperial'
                        to['measure'] = measure_type
                        to['unit'] = v
                    end
                end
            end
        end
    end
    if not from['type'] then
        return false, 'Invalid "from" unit!'
    elseif not to['type'] then
        return false, 'Invalid "to" unit!'
    elseif from['measure'] ~= to['measure'] then
        return false, '"' .. from['measure'] .. '" units cannot be converted into "' .. to['measure'] .. '" units!'
    end
    local result = amount * from['unit']['to_anchor']
    if from['unit']['anchor_shift'] then
        result = result - from['unit']['anchor_shift']
    end
    local unit_type = from['type']
    if from['_anchors'][tostring(unit_type)].transform then
        local transform = from['_anchors'][tostring(unit_type)].transform
        result = transform(result)
    else
        result = result * from['_anchors'][tostring(unit_type)].ratio
    end
    if to['unit']['anchor_shift'] then
        result = result + to['unit']['anchor_shift']
    end
    result = result / to['unit']['to_anchor']
    return result, true
end

return units