// Compiled by Lona Version 0.5.2

import React from "react"
import styled from "styled-components"

import colors from "../colors"
import shadows from "../shadows"
import textStyles from "../textStyles"
import AccessibilityTest from "./AccessibilityTest"
import AccessibilityVisibility from "./AccessibilityVisibility"
import { isFocused, focusFirst, focusLast, focusNext, focusPrevious } from
  "../utils/focusUtils"

export default class AccessibilityNested extends React.Component {
  state = { focusRing: false }

  setFocusRing = (focusRing) => { this.setState({ focusRing }) }

  isFocused = () => {
    let focusElements = this._getFocusElements()

    return !!focusElements.find(isFocused);
  }

  focus = ({ focusRing = true } = { focusRing: true }) => {
    this.setFocusRing(focusRing)

    return focusFirst(this._getFocusElements());
  }

  focusLast = ({ focusRing = true } = { focusRing: true }) => {
    this.setFocusRing(focusRing)

    return focusLast(this._getFocusElements());
  }

  focusNext = ({ focusRing = true } = { focusRing: true }) => {
    this.setFocusRing(focusRing)

    return focusNext(this._getFocusElements());
  }

  focusPrevious = ({ focusRing = true } = { focusRing: true }) => {
    this.setFocusRing(focusRing)

    return focusPrevious(this._getFocusElements());
  }

  _handleKeyDown = (event) => {
    if (event.key === "Tab") {
      this.setFocusRing(true)

      if (event.shiftKey) {
        if (this.focusPrevious()) {
          event.stopPropagation()
          event.preventDefault()
          return ;
        } else if (this.props.onFocusExitPrevious) {
          this.props.onFocusExitPrevious()

          event.stopPropagation()
          event.preventDefault()
          return ;
        }
      } else if (this.focusNext()) {
        event.stopPropagation()
        event.preventDefault()
        return ;
      } else if (this.props.onFocusExitNext) {
        this.props.onFocusExitNext()

        event.stopPropagation()
        event.preventDefault()
        return ;
      }
    }

    if (this.props.onKeyDown) {
      this.props.onKeyDown(event)
    }
  }

  _getFocusElements = () => {
    let elements = [this._AccessibilityTest, this._AccessibilityVisibility]
    return elements.filter(Boolean);
  }

  render() {


    let AccessibilityTest$checkboxValue
    let AccessibilityTest$onToggleCheckbox
    let AccessibilityVisibility$showText

    AccessibilityTest$checkboxValue = this.props.isChecked
    AccessibilityVisibility$showText = this.props.isChecked
    AccessibilityTest$onToggleCheckbox = this.props.onChangeChecked
    return (
      <Container>
        <AccessibilityTestAccessibilityTestWrapper>
          <AccessibilityTest
            checkboxValue={AccessibilityTest$checkboxValue}
            customTextAccessibilityLabel={"Text"}
            onToggleCheckbox={AccessibilityTest$onToggleCheckbox}
            tabIndex={-1}
            className={(
              this.state.focusRing
                ? "lona--focus-ring"
                : "lona--no-focus-ring"
            )}
            onKeyDown={this._handleKeyDown}
            ref={(ref) => { this._AccessibilityTest = ref }}

          />
        </AccessibilityTestAccessibilityTestWrapper>
        <AccessibilityVisibilityAccessibilityVisibilityWrapper>
          <AccessibilityVisibility
            showText={AccessibilityVisibility$showText}
            tabIndex={-1}
            className={(
              this.state.focusRing
                ? "lona--focus-ring"
                : "lona--no-focus-ring"
            )}
            onKeyDown={this._handleKeyDown}
            ref={(ref) => { this._AccessibilityVisibility = ref }}

          />
        </AccessibilityVisibilityAccessibilityVisibilityWrapper>
      </Container>
    );
  }
};

let Container = styled.div({
  alignItems: "flex-start",
  display: "flex",
  flex: "1 1 0%",
  flexDirection: "column",
  justifyContent: "flex-start"
})

let AccessibilityTestAccessibilityTestWrapper = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  display: "flex",
  flex: "1 1 auto",
  flexDirection: "row",
  justifyContent: "flex-start"
})

let AccessibilityVisibilityAccessibilityVisibilityWrapper = styled.div({
  alignItems: "flex-start",
  alignSelf: "stretch",
  display: "flex",
  flex: "1 1 auto",
  flexDirection: "row",
  justifyContent: "flex-start"
})