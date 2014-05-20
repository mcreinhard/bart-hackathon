pi = Math.PI
{sin, cos} = Math

sfOutlineMap = (t) ->
  if 0 <= t <= 5
    return x: 0, y: 37.5 - t
  if 5 < t < 20
    theta = (pi/30) * (t-5) + pi
    return x: 10 * cos(theta) + 10, y: 10 * sin(theta) + 32.5
  if 20 <= t <= 41
    return x: t - 10, y: 22.5

sfOutlineTangentMap = (t) ->
  if 0 <= t <= 5
    return x: 0, y: -1
  if 5 < t < 20
    theta = (pi/30) * (t-5) + pi
    return x: -sin(theta), y: cos(theta)
  if 20 <= t <= 41
    return x: 1, y: 0

richmondOutlineMap = (t) ->
  if 0 <= t <= 1
    return x: 38.5 - t, y: 0
  if 1 < t < 9.5
    theta = (-pi/17) * (t-1) + (3/2) * pi
    return x: 5 * cos(theta) + 37.5, y: 5 * sin(theta) + 5
  if 9.5 <= t <= 25.5
    return x: 32.5, y: t - 4.5

richmondOutlineTangentMap = (t) ->
  if 0 <= t <= 1
    return x: -1, y: 0
  if 1 < t < 9.5
    theta = (-pi/17) * (t-1) + (3/2) * pi
    return x: sin(theta), y: -cos(theta)
  if 9.5 <= t <= 25.5
    return x: 0, y: 1

fremontOutlineMap = (t) ->
  if 0 <= t <= 18.5
    return x: 56 - t, y: 38
  if 18.5 < t < 26
    theta = (pi/15) * (t-18.5) + pi / 2
    return x: 5 * cos(theta) + 37.5, y: 5 * sin(theta) + 33
  if 26 <= t <= 35
    return x: 32.5, y: 59 - t

fremontOutlineTangentMap = (t) ->
  if 0 <= t <= 18.5
    return x: -1, y: 0
  if 18.5 < t < 26
    theta = (pi/15) * (t-18.5) + pi / 2
    return x: -sin(theta), y: cos(theta)
  if 26 <= t <= 35
    return x: 0, y: -1

pbpOutlineMap = (t) ->
  if 0 <= t <= 5
    return x: 59, y: t
  if 5 < t < 12.5
    theta = (pi/15) * (t-5)
    return x: 5 * cos(theta) + 54, y: 5 * sin(theta) + 5
  if 12.5 <= t <= 27.5
    return x: 66.5 - t, y: 10
  if 27.5 < t <= 36
    theta = (-pi/15) * (t-27.5) + (3/2) * pi
    return x: 5 * cos(theta) + 39, y: 5 * sin(theta) + 15

pbpOutlineTangentMap = (t) ->
  if 0 <= t <= 5
    return x: 0, y: 1
  if 5 < t < 12.5
    theta = (pi/15) * (t-5)
    return x: -sin(theta), y: cos(theta)
  if 12.5 <= t <= 27.5
    return x: -1, y: 0
  if 27.5 < t <= 36
    theta = (-pi/15) * (t-27.5) + (3/2) * pi
    return x: sin(theta), y: -cos(theta)

dpOutlineMap = (t) ->
  if 0 <= t <= 3
    return x: 50.5 - t, y: 28
  if 3 < t <= 10.5
    theta = (-pi/15) * (t-3) + (3/2) * pi
    return x: 5 * cos(theta) + 47.5, y: 5 * sin(theta) + 33
  if 10.5 < t < 16
    theta = (pi/11) * (t-10.5)
    return x: 3.5 * cos(theta) + 39, y: 3.5 * sin(theta) + 33
  if 16 <= t <= 18
    return x: 55 - t, y: 36.5

dpOutlineTangentMap = (t) ->
  if 0 <= t <= 3
    return x: -1, y: 0
  if 3 < t <= 10.5
    theta = (-pi/15) * (t-3) + (3/2) * pi
    return x: sin(theta), y: -cos(theta)
  if 10.5 < t < 16
    theta = (pi/11) * (t-10.5)
    return x: -sin(theta), y: cos(theta)
  if 16 <= t <= 18
    return x: -1, y: 0

maps =
  sf: 
    position: sfOutlineMap
    tangent: sfOutlineTangentMap
  richmond:
    position: richmondOutlineMap
    tangent: richmondOutlineTangentMap
  pbp: 
    position: pbpOutlineMap
    tangent: pbpOutlineTangentMap
  dp: 
    position: dpOutlineMap
    tangent: dpOutlineTangentMap
  fremont: 
    position: fremontOutlineMap
    tangent: fremontOutlineTangentMap

route1Map = (t) ->
  if 0 <= t < 36
    s = scheduledToAverage t, 1
    return mapAndOffset s, 'pbp', 0
  if 36 <= t <= 41
    s = scheduledToAverage t, 1
    high = (event.time for event in stations.richmond when event.station is 'MCAR')[0]
    low = (event.time for event in averageSchedules[1] when event.station is 'MCAR')[0]
    return mapAndOffset s + (high - low), 'richmond', 1.5

route1TangentMap = (t) ->
  if 0 <= t < 36
    s = scheduledToAverage t, 1
    return maps.pbp.tangent(s)
  if 36 <= t <= 41
    s = scheduledToAverage t, 1
    high = (event.time for event in stations.richmond when event.station is 'MCAR')[0]
    low = (event.time for event in averageSchedules[1] when event.station is 'MCAR')[0]
    return maps.richmond.tangent(s + (high - low))

route2Map = (t) ->
route2TangentMap = (t) ->

route3Map = (t) ->
  if 0 <= t <= 33
    s = scheduledToAverage t, 3
    return mapAndOffset s, 'fremont', -0.5
  if 33 < t < 36
    return # TODO
  if 36 <= t <= 60
    s = scheduledToAverage(60, 3) - scheduledToAverage(t, 3)
    return mapAndOffset s, 'richmond', 0.5

route3TangentMap = (t) ->
  if 0 <= t <= 33
    s = scheduledToAverage t, 3
    return maps.fremont.tangent(s)
  if 33 < t < 36
    return # TODO
  if 36 <= t <= 60
    s = scheduledToAverage(60, 3) - scheduledToAverage(t, 3)
    return scale -1, maps.richmond.tangent(s)

route4Map = (t) ->
  if 0 <= t <= 25
    s = scheduledToAverage t, 4
    return mapAndOffset s, 'richmond', 0.5
  if 25 < t < 28
    return # TODO
  if 28 <= t <= 61
    s = scheduledToAverage(61, 4) - scheduledToAverage(t, 4)
    return mapAndOffset s, 'fremont', -0.5

route4TangentMap = (t) ->
  if 0 <= t <= 25
    s = scheduledToAverage t, 4
    return maps.richmond.tangent(s)
  if 25 < t < 28
    return # TODO
  if 28 <= t <= 61
    s = scheduledToAverage(61, 4) - scheduledToAverage(t, 4)
    return scale -1, maps.fremont.tangent(s)

route5Map = (t) ->
  if 0 <= t <= 33
    s = scheduledToAverage t, 5
    return mapAndOffset s, 'fremont', 0.5
  if 33 < t < 38
    return # TODO
  if 38 <= t <= 63
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage(63, 5) - scheduledToAverage(t, 5)
    return mapAndOffset (s + dalyCityTime), 'sf', -1.5


route5TangentMap = (t) ->
  if 0 <= t <= 33
    s = scheduledToAverage t, 5
    return maps.fremont.tangent(s)
  if 33 < t < 38
    return # TODO
  if 38 <= t <= 63
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage(63, 5) - scheduledToAverage(t, 5)
    return scale -1, maps.sf.tangent(s + dalyCityTime)

route6Map = (t) ->
  if 0 <= t <= 24
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage t, 6
    return mapAndOffset s + dalyCityTime, 'sf', -1.5
  if 24 < t < 30
    return # TODO
  if 30 <= t <= 63
    s = scheduledToAverage(63, 6) - scheduledToAverage(t, 6)
    return mapAndOffset s, 'fremont', 0.5

route6TangentMap = (t) ->
  if 0 <= t <= 24
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage t, 6
    return maps.sf.tangent(s + dalyCityTime)
  if 24 < t < 30
    return # TODO
  if 30 <= t <= 63
    s = scheduledToAverage(63, 6) - scheduledToAverage(t, 6)
    return scale -1, maps.fremont.tangent(s)


route8Map = (t) ->
  if 0 <= t <= 39
    s = scheduledToAverage t, 8
    return mapAndOffset s, 'sf', 1.5
  if 39 < t < 42
    return # TODO
  if 42 <= t <= 66
    s = scheduledToAverage(66, 8) - scheduledToAverage(t, 8)
    return mapAndOffset s, 'richmond', -0.5

route8TangentMap = (t) ->
  if 0 <= t <= 39
    s = scheduledToAverage t, 8
    return maps.sf.tangent(s)
  if 39 < t < 42
    return # TODO
  if 42 <= t <= 66
    s = scheduledToAverage(66, 8) - scheduledToAverage(t, 8)
    return scale -1, maps.richmond.tangent(s)
    
route7Map = (t) ->
  if 0 <= t <= 24
    s = scheduledToAverage t, 7
    return mapAndOffset s, 'richmond', -0.5
  if 24 < t < 28
    return # TODO
  if 28 <= t <= 69
    s = scheduledToAverage(69, 7) - scheduledToAverage(t, 7)
    return mapAndOffset s, 'sf', 1.5

route7TangentMap = (t) ->
  if 0 <= t <= 24
    s = scheduledToAverage t, 7
    return maps.richmond.tangent(s)
  if 24 < t < 28
    return # TODO
  if 28 <= t <= 69
    s = scheduledToAverage(69, 7) - scheduledToAverage(t, 7)
    return scale -1, maps.sf.tangent(s)

route11Map = (t) ->
  if 0 <= t < 17
    s = scheduledToAverage t, 11
    return mapAndOffset s, 'dp', 0
  if 17 <= t <= 33
    s = scheduledToAverage t, 11
    high = (event.time for event in stations.fremont when event.station is 'BAYF')[0]
    low = (event.time for event in averageSchedules[11] when event.station is 'BAYF')[0]
    return mapAndOffset s + (high - low), 'fremont', -1.5
  if 33 < t < 38
    return # TODO
  if 38 <= t <= 63
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage(63, 11) - scheduledToAverage(t, 11)
    return mapAndOffset (s + dalyCityTime), 'sf', -0.5

route11TangentMap = (t) ->
  if 0 <= t < 17
    s = scheduledToAverage t, 11
    return maps.dp.tangent(s)
  if 17 <= t <= 33
    s = scheduledToAverage t, 11
    high = (event.time for event in stations.fremont when event.station is 'BAYF')[0]
    low = (event.time for event in averageSchedules[11] when event.station is 'BAYF')[0]
    return maps.fremont.tangent(s + (high - low))
  if 33 < t < 38
    return # TODO
  if 38 <= t <= 63
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage(63, 11) - scheduledToAverage(t, 11)
    return scale -1, maps.sf.tangent(s + dalyCityTime)

route12Map = (t) ->
  if 0 <= t <= 24
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage t, 12 
    return mapAndOffset (s + dalyCityTime), 'sf', -0.5
  if 24 < t < 30
    return # TODO
  if 30 <= t <= 44
    s = scheduledToAverage(t, 12)
    high = (event.time for event in stations.fremont when event.station is 'LAKE')[0]
    low = (event.time for event in averageSchedules[12] when event.station is 'LAKE')[0]
    return mapAndOffset high - (s - low), 'fremont', -1.5
  if 44 < t <= 62
    s = scheduledToAverage(62, 12) - scheduledToAverage(t, 12)
    return mapAndOffset s, 'dp', 0

route12TangentMap = (t) ->
  if 0 <= t <= 24
    dalyCityTime = (event.time for event in stations.sf when event.station is 'DALY')[0]
    s = scheduledToAverage t, 12 
    return maps.sf.tangent(s + dalyCityTime)
  if 24 < t < 30
    return # TODO
  if 30 <= t <= 44
    s = scheduledToAverage(t, 12)
    high = (event.time for event in stations.fremont when event.station is 'LAKE')[0]
    low = (event.time for event in averageSchedules[12] when event.station is 'LAKE')[0]
    return scale -1, maps.fremont.tangent(high - (s - low))
  if 44 < t <= 62
    s = scheduledToAverage(62, 12) - scheduledToAverage(t, 12)
    return scale -1, maps.dp.tangent(s)


scheduledToAverage = (t, routeNum) ->
  for event, i in schedules[routeNum]
    if event.time <= t <= (nextEvent = schedules[routeNum][i+1])?.time
      linearScale = d3.scale.linear()
        .domain [event.time, nextEvent.time]
        .range [averageSchedules[routeNum][i].time, averageSchedules[routeNum][i+1].time]
      return linearScale t
  
mapAndOffset = (t, mapName, offset) ->
  add(maps[mapName].position(t), scale(offset, rotate90(maps[mapName].tangent(t))))
  



rotate90 = ({x, y}) -> {x: y, y: -x}

add = (u, v) -> {x: u.x + v.x, y: u.y + v.y}

scale = (c, {x, y}) -> {x: c * x, y: c * y}

subtract = (u, v) -> add u, (scale -1, v)


_(maps).extend
  '1':
    position: route1Map
    tangent: route1TangentMap
  '2':
    position: route2Map
    tangent: route2TangentMap
  '3':
    position: route3Map
    tangent: route3TangentMap
  '4':
    position: route4Map
    tangent: route4TangentMap
  '5':
    position: route5Map
    tangent: route5TangentMap
  '6':
    position: route6Map
    tangent: route6TangentMap
  '7':
    position: route7Map
    tangent: route7TangentMap
  '8':
    position: route8Map
    tangent: route8TangentMap
  '11':
    position: route11Map
    tangent: route11TangentMap
  '12':
    position: route12Map
    tangent: route12TangentMap
