*** Settings ***
Library    SeleniumLibrary

*** Variables ***
${URL}                      https://www.bewellstyle.com/
${BROWSER}                  chrome

${PRODUCT_1_NAME}           เบาะรองหลังเพื่อสุขภาพ สำหรับรถยนต์ | Car Seat Back Cushion
${PRODUCT_1_URL}            https://www.bewellstyle.com/product/car-seat-back-cushion/
${PRODUCT_1_VALUE}          35797

${PRODUCT_2_NAME}           เบาะรองหลังทรงสูง | Healthy Back
${PRODUCT_2_URL}            https://www.bewellstyle.com/product/bewell-healthy-back/
${PRODUCT_2_OPTION}         สีน้ำเงิน - เบาะรองหลังทรงสูง

${PRODUCT_3_NAME}           ผ้าห่มเย็นอัจฉริยะ | Cool Blanket
${PRODUCT_3_URL}            https://www.bewellstyle.com/product/cool-blanket/
${PRODUCT_3_COLOR}          "ฟ้า"
${PRODUCT_3_SIZE}           "200x230cm."

*** Test Cases ***
Add Three Products To Cart
    Open Browser    ${URL}    ${BROWSER}
    Maximize Browser Window

    # Product 1
    Input Text    id=s    ${PRODUCT_1_NAME}
    Click Button  id=searchsubmit

    Go To    ${PRODUCT_1_URL}

    Wait Until Element Is Visible    xpath=//button[@name='add-to-cart' and @value='${PRODUCT_1_VALUE}']
    Click Button                     xpath=//button[@name='add-to-cart' and @value='${PRODUCT_1_VALUE}']

    Wait Until Element Is Visible    xpath=//a[contains(@href,"/shop/") and contains(text(),"Back to shopping")]
    Click Element                    xpath=//a[contains(@href,"/shop/") and contains(text(),"Back to shopping")]

    # Product 2
    Input Text    id=s    ${PRODUCT_2_NAME}
    Click Button  id=searchsubmit

    Go To    ${PRODUCT_2_URL}

    Wait Until Element Is Visible    xpath=//select[@name='attribute_pa_color']
    Select From List By Label        xpath=//select[@name='attribute_pa_color']    ${PRODUCT_2_OPTION}
    Sleep    2 s

    Wait Until Element Is Visible    xpath=//button[contains(@class, "single_add_to_cart_button")]
    Execute Javascript               document.querySelector('button.single_add_to_cart_button').click()

    Go To    https://www.bewellstyle.com/cart/

    Wait Until Element Is Visible    xpath=//a[contains(@href,"/shop/") and contains(text(),"Back to shopping")]
    Click Element                    xpath=//a[contains(@href,"/shop/") and contains(text(),"Back to shopping")]

    # Product 3
    Input Text    id=s    ${PRODUCT_3_NAME}
    Click Button  id=searchsubmit

    Go To    ${PRODUCT_3_URL}

    Wait Until Element Is Visible    xpath=//select[@name='attribute_%e0%b8%aa%e0%b8%b5']
    Select From List By Label        xpath=//select[@name='attribute_%e0%b8%aa%e0%b8%b5']    ${PRODUCT_3_COLOR}  

    Wait Until Element Is Visible    xpath=//select[@name='attribute_%e0%b8%82%e0%b8%99%e0%b8%b2%e0%b8%94']
    Select From List By Label        xpath=//select[@name='attribute_%e0%b8%82%e0%b8%99%e0%b8%b2%e0%b8%94']    ${PRODUCT_3_SIZE}
    Sleep    2 s

    Wait Until Element Is Visible    xpath=//button[contains(@class, "single_add_to_cart_button")]
    Execute Javascript               document.querySelector('button.single_add_to_cart_button').click()

    Go To    https://www.bewellstyle.com/cart/

    Close Browser