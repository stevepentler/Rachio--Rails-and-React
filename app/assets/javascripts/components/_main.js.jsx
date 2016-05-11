'use strict';

var Main = React.createClass({

  getInitialState() {
    return { zones: {} }
  },

  componentDidMount() {
    loadData();
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
        < Zones zones={this.state.zones} />
      </div>
    )
  }
});