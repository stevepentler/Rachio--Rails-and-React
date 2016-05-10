'use strict';

var Main = React.createClass({
  componentDidMount() {
      $.ajax({
      url: '/api/v1/data',
      type: 'GET',
      success: (response) => {
        console.log('it worked', response);
      }
    })
  },
  render() {
    return (
      <div>
        <h1>Main Page</h1>
      </div>
    )
  }
});