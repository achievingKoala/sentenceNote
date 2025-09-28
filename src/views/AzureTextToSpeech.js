const API_KEY = "BxmaEznl4foxzzjLNTxmZ7F8ibK9tNtmm1Cbsyo7Yi45KdebV0oPJQQJ99AKACYeBjFXJ3w3AAAYACOGd5KZ";
const REGION = "eastus";

export const speakText = async (text) => {
  if (text.trim() === "") return;

  // 请求头信息
  const headers = {
    "Content-Type": "application/ssml+xml",
    "X-Microsoft-OutputFormat": "audio-16khz-32kbitrate-mono-mp3",
    "Ocp-Apim-Subscription-Key": API_KEY,
  };

  // 请求体内容（SSML 格式）
  const body = `
    <speak version="1.0" xmlns="http://www.w3.org/2001/10/synthesis" xml:lang="en-US">
      <voice name="en-US-JennyNeural">${text}</voice>
    </speak>`;

  try {
    const response = await fetch(`https://${REGION}.tts.speech.microsoft.com/cognitiveservices/v1`, {
      method: "POST",
      headers,
      body,
    });

    if (!response.ok) {
      throw new Error("Text-to-speech request failed");
    }

    // 将音频文件转为 blob 并播放
    const audioBlob = await response.blob();
    const audioUrl = URL.createObjectURL(audioBlob);
    const audio = new Audio(audioUrl);
    audio.play();
  } catch (error) {
    console.error("Error in Text-to-Speech:", error);
  }
};

export const playSuccessSound = () => {
  try {
    const successSound = new Audio('./new-note.mp3');
    successSound.play().catch(error => {
      console.error('Error playing audio:', error);
    });
  } catch (error) {
    console.error('Error loading audio:', error);
  }
};
