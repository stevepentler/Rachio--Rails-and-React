'use strict';

var App = React.createClass({

  getInitialState() {
    return { zones: {} }
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
    })
  },

  render() {
    return (
      <div>
        < Header />
      </div>
    )
  }
});