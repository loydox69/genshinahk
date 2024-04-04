
from win32api import GetAsyncKeyState, GetCursorPos,mouse_event,Sleep
from win32con import VK_XBUTTON1, MOUSEEVENTF_MOVE 


# 设置鼠标侧键为目标键
target_keycode = VK_XBUTTON1

def key_pressed():
    while True:
        key_state = GetAsyncKeyState(target_keycode)
        # 检查右方向键是否被按下
        if key_state < 0:
            print(GetCursorPos()[0], GetCursorPos()[1])
            # 移动鼠标到目标位置
            mouse_event(MOUSEEVENTF_MOVE , 5000, 0, 0, 1)
            Sleep(100)


# 调用函数开始监听按键
key_pressed()