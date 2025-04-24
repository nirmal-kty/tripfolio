import numpy as np
import pandas as pd
import tensorflow as tf
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import LSTM, Dense, Dropout
from sklearn.preprocessing import MinMaxScaler
import matplotlib.pyplot as plt

# Generate synthetic time-series data
def generate_data(data):
    time = np.array(data)
    # series = np.sin(0.02 * time) + 0.5 * np.random.randn(n_samples)
    return time.reshape(-1, 1)

# Load and prepare data

def forecastdata(data):
    print(data)
    data=generate_data(data)
    print(data)
    scaler = MinMaxScaler(feature_range=(0, 1))
    data_scaled = scaler.fit_transform(data)

    # Create sequences for LSTM
    def create_sequences(data, seq_length=2):
        X, y = [], []
        for i in range(len(data) - seq_length):
            X.append(data[i:i+seq_length])
            y.append(data[i+seq_length])
        return np.array(X), np.array(y)

    seq_length = 2
    X, y = create_sequences(data_scaled, seq_length)
    print(X,y)
    # Split into training and testing sets
    train_size = int(len(X) * 0.8)
    X_train, X_test = X[:train_size], X[train_size:]
    y_train, y_test = y[:train_size], y[train_size:]

    # Build LSTM model
    model = Sequential([
        LSTM(50, return_sequences=True, input_shape=(seq_length, 1)),
        Dropout(0.2),
        LSTM(50, return_sequences=False),
        Dropout(0.2),
        Dense(25),
        Dense(1)
    ])

    model.compile(optimizer='adam', loss='mse')

    # Train the model
    history = model.fit(X_train, y_train, epochs=20, batch_size=16, validation_data=(X_test, y_test))

    # Make predictions
    y_pred = model.predict(X_test)
    y_test_rescaled = scaler.inverse_transform(y_test)
    y_pred_rescaled = scaler.inverse_transform(y_pred)
    return y_pred_rescaled
