// Generated by CoffeeScript 1.7.1
var area, routeNum, svg, t, _i, _j, _k, _len, _ref, _ref1;

svg = d3.select('svg').attr({
  width: window.innerWidth - 30,
  height: window.innerHeight - 30
});

_ref = ['sf', 'richmond', 'pbp', 'dp', 'fremont'];
for (_i = 0, _len = _ref.length; _i < _len; _i++) {
  area = _ref[_i];
  svg.selectAll("line.station." + area).data(stations[area], function(d) {
    return d.station;
  }).enter().append('line').attr({
    x1: function(d) {
      return add(maps[area].position(d.time), scale(d.width[0], rotate90(maps[area].tangent(d.time)))).x;
    },
    y1: function(d) {
      return add(maps[area].position(d.time), scale(d.width[0], rotate90(maps[area].tangent(d.time)))).y;
    },
    x2: function(d) {
      return add(maps[area].position(d.time), scale(d.width[1], rotate90(maps[area].tangent(d.time)))).x;
    },
    y2: function(d) {
      return add(maps[area].position(d.time), scale(d.width[1], rotate90(maps[area].tangent(d.time)))).y;
    }
  }).classed({
    station: true
  }).classed("" + area, true);
  svg.selectAll("text.station." + area).data(stations[area], function(d) {
    return d.station;
  }).enter().append('text').attr({
    x: function(d) {
      return maps[area].position(d.time).x;
    },
    y: function(d) {
      return maps[area].position(d.time).y;
    },
    transform: function(d) {
      return "rotate(-25 " + (maps[area].position(d.time).x) + " " + (maps[area].position(d.time).y) + ")";
    }
  }).text(function(d) {
    return stationNames[d.station.toLowerCase()];
  }).classed({
    station: true
  }).classed("" + area, true);
}

for (routeNum = _j = 1; _j <= 12; routeNum = ++_j) {
  if (((_ref1 = maps[routeNum]) != null ? _ref1.position : void 0) != null) {
    for (t = _k = 0; _k <= 100; t = ++_k) {
      if (maps[routeNum].position(t) != null) {
        svg.append('circle').attr({
          cx: maps[routeNum].position(t).x,
          cy: maps[routeNum].position(t).y,
          r: 0.1
        }).style({
          fill: 'black'
        });
        svg.append('line').attr({
          x1: maps[routeNum].position(t).x,
          y1: maps[routeNum].position(t).y,
          x2: (add(maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t)))).x,
          y2: (add(maps[routeNum].position(t), scale(0.3, maps[routeNum].tangent(t)))).y
        }).style({
          stroke: 'black',
          'stroke-width': 0.06
        });
      }
    }
  }
}

//# sourceMappingURL=app.map
