svg = d3.select 'svg'
  .attr
    width: window.innerWidth - 30
    height: window.innerHeight - 30

for area in ['sf', 'richmond', 'pbp', 'dp', 'fremont']
  svg.selectAll "line.station.#{area}"
    .data stations[area], (d) -> d.station
    .enter()
    .append 'line'
    .attr
      x1: (d) ->
        add(maps[area].position(d.time), scale(1, rotate90(maps[area].tangent(d.time)))).x
      y1: (d) ->
        add(maps[area].position(d.time), scale(1, rotate90(maps[area].tangent(d.time)))).y
      x2: (d) ->
        subtract(maps[area].position(d.time), scale(1, rotate90(maps[area].tangent(d.time)))).x
      y2: (d) ->
        subtract(maps[area].position(d.time), scale(1, rotate90(maps[area].tangent(d.time)))).y
    .classed station: true
    .classed "#{area}", true

  svg.selectAll "text.station.#{area}"
    .data stations[area], (d) -> d.station
    .enter()
    .append 'text'
    .attr
      x: (d) -> maps[area].position(d.time).x
      y: (d) -> maps[area].position(d.time).y
      transform: (d) ->
        "rotate(-45 #{maps[area].position(d.time).x} #{maps[area].position(d.time).y})"
    .text (d) -> stationNames[d.station.toLowerCase()]
    .classed station: true
    .classed "#{area}", true
   
