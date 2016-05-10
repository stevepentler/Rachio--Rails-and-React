'use strict';

var Header = React.createClass({
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
        <span className="header-title">Rachio</span>

      </div>
    )
  }
});