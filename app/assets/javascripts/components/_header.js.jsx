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
        <img src="http://rachio-media.s3.amazonaws.com/images/logo/rachio-logo-for-web-300px.png" />
      </div>
    )
  }
});