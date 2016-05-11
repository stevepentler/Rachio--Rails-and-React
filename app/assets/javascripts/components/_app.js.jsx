'use strict';

var App = React.createClass({

  getInitialState() {
    return { zones: {},
             devices: {}
           }
  },

  componentDidMount() {
    this.loadData()
  },

  getZones() {
    $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log("zones", response)
        this.setState({ zones: response})
      }
    })
  },

  getDevices() {
    $.ajax({
      url: '/api/v1/devices',
      type: 'GET',
      success: (response) => {
        console.log("devices", response)
        this.setState({ devices: response})
      }
    })
  },

  loadData() {
    $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log('Data Loaded', response);
      }
    }).then(this.getZones).then(this.getDevices);
  },

  render() {
    return (
      <div>
        < Header />
      </div>
    )
  }
});