# units-lua

A utility for converting a quantity between different units. Written in pure Lua. Licensed under MIT.

Based on [convert-units](https://github.com/ben-ng/convert-units) by [Ben Ng](http://benng.me).

## Usage

### Parameters

```Lua
units.convert(amount, from, to)
```

`amount` needs to be a numerical value, as the function is going to return the equivalent amount of "from" units in "to" units.
`from` needs to be the unit you want to convert the amount from.
`to` needs to be the unit you want to convert the amount into.

### Example

```Lua
local units = require('units')
local output = units.convert(1000, 'w', 'kw')

print(output)
```

The above script would print `1.0`.

## Units

This library can convert between the following units:

Length: `mm, cm, m, in, ft-us, ft, mi`
Area: `mm2, cm2, m2, ha, km2, in2, ft2, ac, mi2`
Mass: `mcg, mg, g, kg, oz, lb`
Volume: `mm3, cm3, ml, l, kl, m3, km3, tsp, tbsp, in3, fl-oz, cup, pnt, qt, gal, ft3, yd3`
Volume Flow Rate: `mm3/s, cm3/s, ml/s, cl/s, dl/s, l/s, l/min, l/h, kl/s, kl/min, kl/h, m3/s, m3/min, m3/h, km3/s, tsp/s, Tbs/s, in3/s, in3/min, in3/h, fl-oz/s, fl-oz/min, fl-oz/h, cup/s, pnt/s, pnt/min, pnt/h, qt/s, gal/s, gal/min, gal/h, ft3/s, ft3/min, ft3/h, yd3/s, yd3/min, yd3/h`
Temperature: `C, F, K, R`
Time: `ns, mu, ms, s, min, h, d, week, month, year`
Speed: `m/s, km/h, m/h, knot, ft/s`
Pressure: `Pa, hPa, kPa, MPa, bar, torr, psi, ksi`
Digital: `b, Kb, Mb, Gb, Tb, B, KB, MB, GB, TB`
Parts-Per: `ppm, ppb, ppt, ppq`
Voltage: `V, mV, kV`
Current: `A, mA, kA`
Power: `W, mW, kW, MW, GW`
Apparent Power: `VA, mVA, kVA, MVA, GVA`
Reactive Power: `VAR, mVAR, kVAR, MVAR, GVAR`
Energy: `Wh, mWh, kWh, MWh, GWh, J, kJ`
Reactive Energy: `VARh, mVARh, kVARh, MVARh, GVARh`

_Note: both "from" and "to" units must be of the same type, i.e. you can't convert "w" to "mm", since power units cannot be converted into length units!_
