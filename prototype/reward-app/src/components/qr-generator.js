import React from "react"
import { Container, Row, Col, Form, Button } from "react-bootstrap"
// import {QRCode} from "qrcode"
const QRCode = require("qrcode")
class QRGenerator extends React.Component {
  state = {
    name: "",
    mobile: "",
    errors: {
      name: "",
      mobile: "",
    },
    formValid: false,
  }
  handleInputChange = event => {
    const target = event.target
    const value = target.value
    const name = target.name
    this.setState({
      [name]: value,
    })
  }
  handleSubmit = event => {
    event.preventDefault()
    // alert(`Welcome ${this.state.name} ${this.state.mobile}!`)
    QRCode.toCanvas(
      document.getElementById("canvas"),
      `${this.state.mobile},${this.state.name}`,
      function(error) {
        if (error) console.error(error)
        console.log("success!")
      }
    )
  }
  render() {
    return (
      <div>
        <Container>
          <Row>
            <Col sm>
              <Form onSubmit={this.handleSubmit}>
                <Form.Group controlId="formGroupName">
                  <Form.Label>Name</Form.Label>
                  <Form.Control
                    required
                    type="text"
                    placeholder="Enter full name"
                    name="name"
                    value={this.state.name}
                    onChange={this.handleInputChange}
                  />
                  <Form.Control.Feedback type="invalid">
                    Please enter full name.
                  </Form.Control.Feedback>
                </Form.Group>
                <Form.Group controlId="formGroupMobile">
                  <Form.Label>Mobile Number</Form.Label>
                  <Form.Control
                    required
                    type="number"
                    placeholder="Enter mobile number"
                    name="mobile"
                    value={this.state.mobile}
                    onChange={this.handleInputChange}
                  />
                  <Form.Control.Feedback type="invalid">
                    Please enter mobile number.
                  </Form.Control.Feedback>
                </Form.Group>
                {/* <Form.Group controlId="formGroupEmail">
        <Form.Label>Email address</Form.Label>
        <Form.Control type="email" placeholder="Enter email" />
      </Form.Group> */}
                {/* disabled={!this.state.formValid} */}
                <div className="text-center">
                  <Button variant="primary" type="submit">
                    Generate
                  </Button>
                </div>
              </Form>
            </Col>
          </Row>
          <Row>
            <Col sm>
              <div className="text-center" style={{margin: '10px'}}>
                <canvas id="canvas"></canvas>
              </div>
            </Col>
          </Row>
        </Container>
      </div>
    )
  }
}
export default QRGenerator
