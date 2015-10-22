React       = require 'react'
timeUtils   = require '../../util/time-utils'
cx          = require 'classnames'
ComponentUsageExample = require '../documentation/component-usage-example'
Example = require '../documentation/example-data'

DepartureTime = (props) ->
  <span style={props.style} className={cx "time", "realtime": props.realtime}>
    {timeUtils.renderDepartureStoptime props.departureTime, props.realtime, props.currentTime}
  </span>

DepartureTime.description =
  <div>
    <p>Display time in correct format. Displays minutes for 20 minutes,
       otherwise in HH:mm format. Also, it takes into account if the time is realtime.</p>
    <ComponentUsageExample description="real time">
      <DepartureTime departureTime={Example.realtimeDeparture.stoptime} realtime={Example.realtimeDeparture.realtime} currentTime={Example.currentTime}/>
    </ComponentUsageExample>
    <ComponentUsageExample description="not real time">
      <DepartureTime departureTime={Example.departure.stoptime} realtime={Example.departure.realtime} currentTime={Example.currentTime}/>
    </ComponentUsageExample>
  </div>

DepartureTime.propTypes =
  departureTime: React.PropTypes.number.isRequired
  realtime: React.PropTypes.bool
  currentTime: React.PropTypes.number.isRequired
  style: React.PropTypes.object

DepartureTime.displayName = "DepartureTime"

module.exports = DepartureTime