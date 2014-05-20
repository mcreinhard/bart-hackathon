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






rotate90 = ({x, y}) -> {x: y, y: -x}

add = (u, v) -> {x: u.x + v.x, y: u.y + v.y}

scale = (c, {x, y}) -> {x: c * x, y: c * y}

subtract = (u, v) -> add u, (scale -1, v)
