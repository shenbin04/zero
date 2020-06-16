import React, {Component, useEffect, useMemo, useState} from 'react'
import {hello as helloIndex} from 'shared'
import {hello} from 'shared/hello'
// import logo from './logo.svg';
// import './App.css';

const defaultValue = {}

let v = null
let setV = null

function Example() {
  const [value, setValue] = useValue()

  console.log('=========rendering Example: ', value, v, value === v)
  console.log('=========rendering Example2: ', setValue === setV)

  v = value

  setV = setValue

  return <div>{JSON.stringify(value)}</div>
}

function useValue() {
  const [value, setValue] = useState(defaultValue)

  useEffect(() => {
    setInterval(() => {
      setValue({random: Math.random()})
    }, 10000)
  }, [])

  return [value]
}

function App() {
  const [count, setCount] = useState(0)

  useEffect(() => {
    setInterval(() => {
      setCount((count) => count + 1)
    }, 1000)
  }, [])

  console.log('=================rendering App: ', count)
  return <Example />
}

export default App
