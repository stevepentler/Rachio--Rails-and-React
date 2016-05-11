var WateringForm = React.createClass({
  render() {
    var zone = this.props.zone
    return(
      <form>
        <h6>Watering Duration</h6>
        <input type="number" placeholder={zone.lastWateredDuration + " mins"} />
        <button className="btn center">Water {zone.name}</button>
      </form>
    )
  }
})