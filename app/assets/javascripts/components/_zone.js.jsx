'use strict';

const Zone = React.createClass({

  render() {
    let zone = this.props.zone
    let date = new Date(zone.lastWateredDate).toLocaleString();
    let previousDuration = parseInt(zone.lastWateredDuration / 60)

    return(
      <div className="card zone-card">
        <div className="row">
          <div className="col s5 offset-s1">
            <h4>{zone.name}</h4>
            <h6>Previous Watering:</h6>
            <h6>{previousDuration} mins on {date}</h6>
          </div>

          <div className="col s4 offset-s1">
            < WateringForm zone={this.props.zone} waterZone={this.props.waterZone} />
          </div>
        </div>
      </div>
    )
  }

});