sched = null

$.get 'http://api.bart.gov/api/sched.aspx',
  cmd: 'routesched'
  route: 8
  key: 'UDLR-ZTYV-ENAU-LPAW', (data) -> sched = data
    
