import React from "react";
import { Container, Row, Col, Form, Button } from "react-bootstrap";
class GoldPriceCalculator extends React.Component {
  constructor(props) {
    console.log("GoldPriceCalculator constructing");
    super(props);
    this.state = {
      goldPriceRt: 3770.0,
      weight: '',
      makingCharges: 450.0,
      mcDiscountPrct: 20.0,
      totalDiscount: 0.0,
      totalMakingCharge: 0.0,
      totalPrice: 0.0,
      totalGoldPrice: 0.0,
      totalGST: 0.0,
      totalPriceWGST:0.0,
      totalOtherCharges:100.0
    };
    this.handleInputChange = this.handleInputChange.bind(this);
    this.handleSubmit = this.handleSubmit.bind(this);
  }

  handleInputChange = event => {
    const target = event.target;
    const value = target.value;
    const name = target.name;
    this.setState({
      [name]: value
    });
  };
  handleInputChangeWeight = event => {
    const target = event.target;
    const value = target.value;
    const name = target.name;
    if(value > 0) {
      const totalMakingCharge = value *this.state.makingCharges;
      const totalDiscount =
        -(value * this.state.makingCharges * this.state.mcDiscountPrct) / 100;
      const totalGoldPrice = value * this.state.goldPriceRt;
      const totalPrice = totalGoldPrice + totalMakingCharge+ totalDiscount +parseFloat(this.state.totalOtherCharges);
      const totalGST = totalPrice*0.03;
      const totalPriceWGST = totalPrice + totalGST;
      this.setState({
        [name]: value,
        totalDiscount: totalDiscount.toFixed(2),
        totalMakingCharge: totalMakingCharge.toFixed(2),
        totalPrice: totalPrice.toFixed(2),
        totalGoldPrice: totalGoldPrice.toFixed(2),
        totalGST: totalGST.toFixed(2),
        totalPriceWGST : totalPriceWGST.toFixed(2)
      });
    } else {
      this.setState({
        [name]: value
      });
    }
  };
  handleInputChangeOtherCharges = event => {
    const target = event.target;
    const value = target.value;
    const name = target.name;
    if(value > 0) {
      const totalPrice = parseFloat(this.state.totalPrice)+parseFloat(value);
      const totalGST = totalPrice*0.03;
      const totalPriceWGST = totalPrice + totalGST
      this.setState({
        [name]: value,
        totalPrice: totalPrice.toFixed(2),
        totalGST: totalGST.toFixed(2),
        totalPriceWGST : totalPriceWGST.toFixed(2)
      });
    } else {
      this.setState({
        [name]: value
      });
    }
  };
  handleSubmit = event => {
    this.setState({
      goldPriceRt: 3750.0,
      weight: '',
      makingCharges: 450.0,
      mcDiscountPrct: 20.0,
      totalDiscount: 0.0,
      totalMakingCharge: 0.0,
      totalPrice: 0.0,
      totalGoldPrice: 0.0,
      totalGST:0.0,
      totalPriceWGST:0.0,
      totalOtherCharges:100
    });
  };
  render() {
    return (
      <div>
        <Container>
          <Row>
            <Col sm>
              {/* <Form onSubmit={this.handleSubmit}> */}
                <Form.Group controlId="formGroupGoldPrice">
                  <Form.Label>Gold Rate Per Gram</Form.Label>
                  <Form.Control
                    required
                    type="number"
                    placeholder="Enter gold rate per gram"
                    name="goldPriceRt"
                    value={this.state.goldPriceRt}
                    onChange={this.handleInputChange}
                  />
                </Form.Group>
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Making Charge (MC) Rate Per Gram</Form.Label>
                  <Form.Control
                    required
                    type="number"
                    placeholder="Enter mobile number"
                    name="makingCharges"
                    value={this.state.makingCharges}
                    onChange={this.handleInputChange}
                  />
                </Form.Group>
                <Form.Group controlId="formGroupWeight">
                  <Form.Label>Other Charges</Form.Label>
                  <Form.Control
                    required
                    type="number"
                    placeholder="Enter other charges"
                    name="totalOtherCharges"
                    value={this.state.totalOtherCharges}
                    onChange={this.handleInputChange}
                  />
                </Form.Group>
                <Form.Group controlId="formGroupWeight">
                  <Form.Label>Weight in Gram</Form.Label>
                  <Form.Control
                    required
                    type="number"
                    placeholder="Enter weight in gram, e.g.; 1.98"
                    autoFocus
                    name="weight"
                    value={this.state.weight}
                    onChange={this.handleInputChangeWeight}
                  />
                  
                </Form.Group>
                
                {/* <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Discount on MC (%)</Form.Label>
                  <Form.Control
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="mcDiscountPrct"
                    value={this.state.mcDiscountPrct}
                    onChange={this.handleInputChange}
                  />
                  
                </Form.Group> */}
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Total Gold Price ({this.state.goldPriceRt} X {this.state.weight})</Form.Label>
                  <Form.Control
                  readOnly
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="totalGoldPrice"
                    value={this.state.totalGoldPrice}
                    onChange={this.handleInputChange}
                  />
                </Form.Group>
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Making Charges ({this.state.makingCharges} X {this.state.weight})</Form.Label>
                  <Form.Control
                  readOnly
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="totalMakingCharge"
                    value={this.state.totalMakingCharge}
                    onChange={this.handleInputChange}
                  />
                </Form.Group>
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Discount on MC ({this.state.mcDiscountPrct} % on {this.state.totalMakingCharge})</Form.Label>
                  <Form.Control
                  readOnly
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="totalDiscount"
                    value={this.state.totalDiscount}
                    onChange={this.handleInputChange}
                  />
                  
                </Form.Group>
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Total Price </Form.Label>
                  <Form.Control
                  readOnly
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="totalPrice"
                    value={this.state.totalPrice}
                    onChange={this.handleInputChange}
                  />
                  
                </Form.Group>
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>GST (3%)</Form.Label>
                  <Form.Control
                  readOnly
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="totalGST"
                    value={this.state.totalGST}
                    onChange={this.handleInputChange}
                  />
                  
                </Form.Group>
                <Form.Group controlId="formGroupMakingCharges">
                  <Form.Label>Total Price With GST</Form.Label>
                  <Form.Control
                  readOnly
                    required
                    type="number"
                    placeholder="Enter discount"
                    name="totalPriceWGST"
                    value={this.state.totalPriceWGST}
                    onChange={this.handleInputChange}
                  />
                  
                </Form.Group>
                <div className="text-center">
                  <Button
                    variant="primary"
                    type="submit"
                    className="font-weight-bold"
                    onClick={this.handleSubmit}
                  >
                    Reset
                  </Button>
                </div>
              {/* </Form> */}
            </Col>
          </Row>
        </Container>
      </div>
    );
  }
}
export default GoldPriceCalculator;
