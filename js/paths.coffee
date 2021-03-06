svg = d3.select 'svg'

# Pittsburg/Bay Point Line
svg.append 'path'
  .attr
    d: 'M -.5 37.5
      V 32.5
      A 10.5 10.5 0 0 1 10 22
      H 32
      a 2 2 0 0 0 2 -2
      V 15
      a 5 5 0 0 1 5 -5
      H 54
      a 5 5 0 0 0 5 -5
      V 0'
  .style
    stroke: '#e6e62e' # yellow
  .classed
    line: true

# Richmond Line
svg.append 'path'
  .attr
    d: 'M -1.5 37.5
      V 32.5
      A 11.5 11.5 0 0 1 10 21
      H 31
      A 1 1 0 0 0 32 20
      V 5
      A 5.5 5.5 0 0 1 37.5 -.5
      H 38.5'
  .style
    stroke: '#ff0000' # red
  .classed
    line: true

# Dublin/Pleasanton Line
svg.append 'path'
  .attr
    d: 'M 6.136001890779891 23.821318152395293
      A 9.5 9.5 0 0 1 10 23
      H 32
      a 2 2 0 0 1 2 2
      V 33
      a 3.5 3.5 0 0 0 3.5 3.5
      h 1.5
      a 3.5 3.5 0 0 0 3.5 -3.5
      a 5 5 0 0 1 5 -5
      H 50.5'
  .style
    stroke: '#0099cc' # blue
  .classed
    line: true

# Fremont Line
svg.append 'path'
  .attr
    d: 'M 6.542738533855692 24.734863610037895
      A 8.5 8.5 0 0 1 10 24
      H 31
      a 1 1 0 0 1 1 1
      V 33
      a 5.5 5.5 0 0 0 5.5 5.5
      H 56'
  .style
    stroke: '#339933' # green
  .classed
    line: true

# Richmond-Fremont Line
svg.append 'path'
  .attr
    d: 'M 38.5 .5
      H 37.5
      a 4.5 4.5 0 0 0 -4.5 4.5
      V 33
      a 4.5 4.5 0 0 0 4.5 4.5
      H 56'
  .style
    stroke: '#ff9933' # orange
  .classed
    line: true

# Millbrae--West Oakland
svg.append 'path'
  .attr
    d: 'M 0 37.5
      V 32.5
      A 10 10 0 0 1 10 22.5
      H 31'
  .classed
    outline: true
    
# West Oakland--Richmond
svg.append 'path'
  .attr
    d: 'M 31 22.5
      A 1.5 1.5 0 0 0 32.5 21
      V 5
      A 5 5 0 0 1 37.5 0
      H 38.5'
  .classed
    outline: true

# West Oakland--Fremont
svg.append 'path'
  .attr
    d: 'M 31 22.5
      A 1.5 1.5 0 0 1 32.5 24
      V 33
      A 5 5 0 0 0 37.5 38
      H 56'
  .classed
    outline: true

# MacArthur--Pittsburg/Bay Point
svg.append 'path'
  .attr
    d: 'M 34 15
      A 5 5 0 0 1 39 10
      H 54
      A 5 5 0 0 0 59 5
      V 0'
  .classed
    outline: true

# Bay Fair--Dublin/Pleasanton
svg.append 'path'
  .attr
    d: 'M 37.5 36.5
      H 39
      A 3.5 3.5 0 0 0 42.5 33
      A 5 5 0 0 1 47.5 28
      H 50.5'
  .classed
    outline: true

# 12th Street Oakland--Lake Merritt
svg.append 'path'
  .attr
    d: 'M 32.5 21 V 24'
  .classed
    outline: true

