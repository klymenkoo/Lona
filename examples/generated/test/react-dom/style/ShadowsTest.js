// Compiled by Lona Version 0.5.2

import React from "react"
import styled from "styled-components"

import colors from "../colors"
import shadows from "../shadows"
import textStyles from "../textStyles"

export default class ShadowsTest extends React.Component {
  render() {


    let Inner$shadow
    Inner$shadow = shadows.elevation2

    if (this.props.largeShadow) {

      Inner$shadow = shadows.elevation3
    }
    return <Container> <Inner style={{ ...Inner$shadow }} /> </Container>;
  }
};

let Container = styled.div({
  alignItems: "center",
  display: "flex",
  flex: "1 1 0%",
  flexDirection: "column",
  justifyContent: "flex-start",
  paddingTop: "20px",
  paddingBottom: "20px"
})

let Inner = styled.div({
  alignItems: "flex-start",
  backgroundColor: colors.blue300,
  display: "flex",
  flexDirection: "column",
  justifyContent: "flex-start",
  ...shadows.elevation2,
  width: "60px",
  height: "60px"
})