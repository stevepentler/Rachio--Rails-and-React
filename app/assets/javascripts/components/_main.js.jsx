'use strict';

var Main = React.createClass({
  componentDidMount: function() {
    loadData();
  },

  loadData: function() {
    $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log('Data Loaded', response);
      }
    })
  },

  getInitialState() {
    return { zones: {} }
  },

  render() {
    return (
      <div>
        < Header />
        < Zones zones={this.state.zones} />
      </div>
    )
  }
});