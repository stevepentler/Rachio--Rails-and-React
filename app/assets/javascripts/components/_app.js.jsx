'use strict';

var App = React.createClass({

  getInitialState() {
    return { zones: {} }
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

  loadData() {
    $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log('Data Loaded', response);
      }
    }).then(this.getZones)
  },

  render() {
    return (
      <div>
        < Header />
      </div>
    )
  }
});