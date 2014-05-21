sched = null

$.get 'http://api.bart.gov/api/sched.aspx',
  cmd: 'routesched'
  route: 8
  key: 'UDLR-ZTYV-ENAU-LPAW', (data) -> sched = data
    
getETD = (station, callback) ->
  $.get 'http://api.bart.gov/api/etd.aspx',
    cmd: 'etd'
    orig: station
    key: 'UDLR-ZTYV-ENAU-LPAW', (data) ->
      results = []
      $(data).find('estimate').each ->
        $this = $ this
        color = $this.find('color').text()
        destination = $this.prevAll('abbreviation').text()
        results.push
          minutes: parseInt $this.find('minutes').text()
          direction: $this.find('direction').text()
          length: parseInt $this.find('length').text()
          color: color
          destination: destination
          route: getRoute color, destination
      callback results
  
getRoute = (color, destination) ->
  switch color
    when 'YELLOW'
      return if destination is 'PITT' then 2 else 1
    when 'ORANGE'
      return if destination is 'RICH' then 3 else 4
    when 'GREEN'
      return if destination is 'FRMT' then 6 else 5
    when 'RED'
      return if destination is 'RICH' then 8 else 7
    when 'BLUE'
      return if destination is 'DUBL' then 12 else 11
    
trains = []

populateTrains = ->
  _([1, 2, 3, 4, 5, 6, 7, 8, 11, 12]).map (routeNum) ->
    _(schedules[routeNum][1..]).map (event, i) ->
      prevEvent = schedules[routeNum][i]
      getETD event.station, (results) ->
        for train in results when train.route is routeNum
          if train.minutes <= event.time - prevEvent.time
            trains.push
              route: routeNum
              position: event.time - train.minutes
              length: train.length
              
      
