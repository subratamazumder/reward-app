import React from "react";
import { Container, Row, Col, Form, Button, Figure } from "react-bootstrap";
// import {QRCode} from "qrcode"
const QRCode = require("qrcode");
class QRGenerator extends React.Component {
  state = {
    name: "",
    mobile: "",
    errors: {
      name: "",
      mobile: ""
    },
    formValid: false
  };
  handleInputChange = event => {
    const target = event.target;
    const value = target.value;
    const name = target.name;
    this.setState({
      [name]: value
    });
  };
  handleSubmit = event => {
    event.preventDefault();
    const qrInput = `${this.state.mobile},${this.state.name}`;
    const qrOptions = {
      width : 300
    } 
    QRCode.toDataURL(qrInput, qrOptions, function(err, url) {
      console.log(url);
      document.getElementById("qr").src = url;
      document.getElementById("qr_caption").hidden = false;
    });
  };
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
                  <Button variant="primary" type="submit" className="font-weight-bold">
                    Generate
                  </Button>
                </div>
              </Form>
            </Col>
          </Row>
          <Row>
            <Col sm>
              <div className="text-center" style={{ margin: "10px" }}>
                <Figure>
                  <Figure.Image
                    id="qr"
                    // width={171}
                    // height={180}
                    // alt="171x180"
                    src=""
                  />
                  <Figure.Caption id="qr_caption" hidden={true} className="text-success">QR Generated successfully</Figure.Caption>
                </Figure>
              </div>
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}
export default QRGenerator;
