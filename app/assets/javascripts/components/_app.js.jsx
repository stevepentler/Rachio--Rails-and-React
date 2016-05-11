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


  render() {
    return (
      <div>
        < Header />
        < Device device={this.state.device} zones={this.state.zones} />
      </div>
    )
  }
});