'use strict';

var App = React.createClass({

  getInitialState() {
    return { zones: {},
             device: {}
           }
  },

  componentDidMount() {
    this.loadData()
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
        this.setState({ device: response})
      }
    })
  },

  waterZone(zoneData) {
    console.log("zonedata", zoneData)
     $.ajax({
      url: '/api/v1/zones/' + zoneData.zoneId,
      type: 'PUT',
      data: zoneData,
      success: (response) => {
        console.log("watering")
      },
      error: (response) => {
        console.log("error, not watering")
      }
    })
  },


  render() {
    return (
      <div className="container">
        < Header />
        < Device device={this.state.device} zones={this.state.zones} waterZone={this.waterZone} />
      </div>
    )
  }
});