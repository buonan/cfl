# CFL - Windows CE Foundation Class Library

**CFL** is a lightweight C++ library designed to simplify Windows CE application development. It provides a small set of helper classes and abstractions for common tasks like window management, messages, and dialogs on Windows CE devices.

🛠️ **Built for C++ and Windows CE**  
📄 **MIT Licensed**  
📦 **Compact and Easy to Integrate**

---

## Features

- Simplified wrapper around Windows CE API
- Lightweight and modular
- Easy creation of windows, dialogs, and message loops
- Clean object-oriented structure
- Minimal dependencies

---

## Getting Started

### Requirements

- Windows CE development environment (e.g., Platform Builder, Visual Studio with CE SDK)
- C++ compiler for Windows CE

### Integration

1. Clone the repository:

   ```bash
   git clone https://github.com/buonan/cfl.git
   ```

2. Add the source files to your Windows CE project.

3. Include the relevant headers in your code:

   ```cpp
   #include "cfl/window.h"
   ```

4. Use the library to create a window or dialog.

---

## Example

```cpp
#include "cfl/app.h"
#include "cfl/window.h"

class MyWindow : public cfl::Window {
protected:
    void OnPaint(HDC hdc) override {
        TextOut(hdc, 10, 10, L"Hello, CFL!", 11);
    }
};

int WINAPI WinMain(HINSTANCE hInstance, HINSTANCE, LPWSTR, int) {
    cfl::App app(hInstance);
    MyWindow window;
    return app.Run(window);
}
```

---

## License

This project is licensed under the [MIT License](LICENSE).  
You are free to use, modify, and distribute it with attribution.

---

## Author

Created by [@buonan](https://github.com/buonan).  
Feel free to contribute or open issues for bugs and suggestions.
