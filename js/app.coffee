width = 1200
height = 800

svg = d3.select 'body'
  .append 'svg'
  .attr
    viewBox: '-1 -1 60 40'
    width: window.innerWidth - 30
    height: window.innerHeight - 30
    preserveAspectRatio: 'align xMidYMid'

# Millbrae--West Oakland
svg.append 'path'
  .attr
    d: 'M 0 37.5
      V 32.5
      A 10 10 0 0 1 10 22.5
      H 31'
    
# West Oakland--Richmond
svg.append 'path'
  .attr
    d: 'M 31 22.5
      A 1.5 1.5 0 0 0 32.5 21
      V 5
      A 5 5 0 0 1 37.5 0
      H 38.5'

# West Oakland--Fremont
svg.append 'path'
  .attr
    d: 'M 31 22.5
      A 1.5 1.5 0 0 1 32.5 24
      V 33
      A 5 5 0 0 0 37.5 38
      H 56'

# MacArthur--Pittsburg/Bay Point
svg.append 'path'
  .attr
    d: 'M 32.5 15
      A 5 5 0 0 1 37.5 10
      H 52.5
      A 5 5 0 0 0 57.5 5
      V 0'

# Bay Fair--Dublin/Pleasanton
svg.append 'path'
  .attr
    d: 'M 37.5 38
      A 5 5 0 0 0 42.5 33
      A 5 5 0 0 1 47.5 28
      H 50.5'

# 12th Street Oakland--Lake Merritt
svg.append 'path'
  .attr
    d: 'M 32.5 21 V 24'
