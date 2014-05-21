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
        add(maps[area].position(d.time), scale(d.width[0], rotate90(maps[area].tangent(d.time)))).x
      y1: (d) ->
        add(maps[area].position(d.time), scale(d.width[0], rotate90(maps[area].tangent(d.time)))).y
      x2: (d) ->
        add(maps[area].position(d.time), scale(d.width[1], rotate90(maps[area].tangent(d.time)))).x
      y2: (d) ->
        add(maps[area].position(d.time), scale(d.width[1], rotate90(maps[area].tangent(d.time)))).y
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
        "rotate(-25 #{maps[area].position(d.time).x} #{maps[area].position(d.time).y})"
    .text (d) -> stationNames[d.station.toLowerCase()]
    .classed station: true
    .classed "#{area}", true
   
for routeNum in [1..12] when maps[routeNum]?.position?
  for t in [0..100]
    if maps[routeNum].position(t)?
      svg.append 'circle'
        .attr
          cx: maps[routeNum].position(t).x
          cy: maps[routeNum].position(t).y
          r: 0.1
        .style
          fill: 'none'
      svg.append 'line'
        .attr
          x1: maps[routeNum].position(t).x
          y1: maps[routeNum].position(t).y
          x2: (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).x
          y2: (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).y
        .style
          stroke: 'none'
          'stroke-width': 0.06

renderTrain = (train) ->
  t = train.position
  routeNum = train.route
  length = train.length
  trainLine = svg.append 'line'
    .classed
      train: true
  if maps[routeNum].position(t)?
    trainLine.attr
      x1: (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t)))?.x || 0
      y1: (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t)))?.y || 0
      x2: (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t)))?.x || 0
      y2: (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t)))?.y || 0

renderTrains = ->
  svg.selectAll 'line.train'
    .data trains
    .enter()
    .append 'line'
    .classed train: true
    .attr
      x1: (d) ->
        t = d.position
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).x
        else
          0
      y1: (d) ->
        t = d.position
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).y
        else
          0
      x2: (d) ->
        t = d.position
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t))).x
        else
          0
      y2: (d) ->
        t = d.position
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t))).y
        else
          0
    .transition()
    .tween 'bart', ->
      (s) ->
        d3.select(this).attr
            x1: (d) ->
              t = d.position + s * 10
              routeNum = d.route
              length = d.length
              if maps[routeNum].position(t)?
                (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).x
              else
                0
            y1: (d) ->
              t = d.position + s * 10
              routeNum = d.route
              length = d.length
              if maps[routeNum].position(t)?
                (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).y
              else
                0
            x2: (d) ->
              t = d.position + s * 10
              routeNum = d.route
              length = d.length
              if maps[routeNum].position(t)?
                (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t))).x
              else
                0
            y2: (d) ->
              t = d.position + s * 10
              routeNum = d.route
              length = d.length
              if maps[routeNum].position(t)?
                (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t))).y
              else
                0
    .duration 60000
    .ease 'linear'
    .attr
      x1: (d) ->
        t = d.position + 10
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).x
        else
          0
      y1: (d) ->
        t = d.position + 10
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t))).y
        else
          0
      x2: (d) ->
        t = d.position + 10
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t))).x
        else
          0
      y2: (d) ->
        t = d.position + 10
        routeNum = d.route
        length = d.length
        if maps[routeNum].position(t)?
          (add maps[routeNum].position(t), scale(-0.3, maps[routeNum].tangent(t))).y
        else
          0


