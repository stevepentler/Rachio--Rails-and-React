'use strict';

var Zone = React.createClass({

  render() {
    var zone = this.props.zone
    var date = new Date(zone.lastWateredDate).toLocaleString();
    return(
      <div className="card zone-card">
        <div className="row">
          <div className="col s3">
            <h4>{zone.name}</h4>
            <h6>Previous Watering:</h6>
            <h6>{zone.lastWateredDuration} mins on {date}</h6>
          </div>

          <div className="col s2">
            < WateringForm zone={this.props.zone} waterZone={this.props.waterZone} />
          </div>
        </div>
      </div>
    )
  }

});