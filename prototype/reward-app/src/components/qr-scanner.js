import React from "react"
import { Form, Button } from "react-bootstrap"
import QrReader from 'react-qr-reader'
class QRScanner extends React.Component {
  state = {
    result: 'No result'
  }
 
  handleScan = data => {
    if (data) {
      console.log("got QR code...",data)
      this.setState({
        result: data
      })
    }
  }
  handleError = err => {
    console.error(err)
  }
  render() {
    return (
      <div>
        <QrReader
          delay={300}
          onError={this.handleError}
          onScan={this.handleScan}
          style={{ width: '100%' }}
        />
        <p>{this.state.result}</p>
      </div>
    )
  }
}
export default QRScanner
