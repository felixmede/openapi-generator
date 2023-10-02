<?php
/**
 * ApiResponse
 *
 * PHP version 8.1.1
 *
 * @category Class
 * @package  OpenAPI\Server\Model
 * @author   OpenAPI Generator team
 * @link     https://github.com/openapitools/openapi-generator
 */

/**
 * OpenAPI Petstore
 *
 * This is a sample server Petstore server. For this sample, you can use the api key `special-key` to test the authorization filters.
 *
 * The version of the OpenAPI document: 1.0.0
 * 
 * Generated by: https://github.com/openapitools/openapi-generator.git
 *
 */

/**
 * NOTE: This class is auto generated by the openapi generator program.
 * https://github.com/openapitools/openapi-generator
 * Do not edit the class manually.
 */

namespace OpenAPI\Server\Model;

use Symfony\Component\Validator\Constraints as Assert;
use JMS\Serializer\Annotation\Type;
use JMS\Serializer\Annotation\SerializedName;

/**
 * Class representing the ApiResponse model.
 *
 * Describes the result of uploading an image resource
 *
 * @package OpenAPI\Server\Model
 * @author  OpenAPI Generator team
 */

class ApiResponse 
{
        /**
     * @var int|null
     * @SerializedName("code")
     * @Assert\Type("int")
     * @Type("int")
     */
    protected ?int $code = null;

    /**
     * @var string|null
     * @SerializedName("type")
     * @Assert\Type("string")
     * @Type("string")
     */
    protected ?string $type = null;

    /**
     * @var string|null
     * @SerializedName("message")
     * @Assert\Type("string")
     * @Type("string")
     */
    protected ?string $message = null;

    /**
     * Constructor
     * @param array|null $data Associated array of property values initializing the model
     */
    public function __construct(array $data = null)
    {
        if (is_array($data)) {
            $this->code = array_key_exists('code', $data) ? $data['code'] : $this->code;
            $this->type = array_key_exists('type', $data) ? $data['type'] : $this->type;
            $this->message = array_key_exists('message', $data) ? $data['message'] : $this->message;
        }
    }

    /**
     * Gets code.
     *
     * @return int|null
     */
    public function getCode(): ?int
    {
        return $this->code;
    }

    /**
     * Sets code.
     *
     * @param int|null $code
     *
     * @return $this
     */
    public function setCode(?int $code = null): self
    {
        $this->code = $code;

        return $this;
    }

    /**
     * Gets type.
     *
     * @return string|null
     */
    public function getType(): ?string
    {
        return $this->type;
    }

    /**
     * Sets type.
     *
     * @param string|null $type
     *
     * @return $this
     */
    public function setType(?string $type = null): self
    {
        $this->type = $type;

        return $this;
    }

    /**
     * Gets message.
     *
     * @return string|null
     */
    public function getMessage(): ?string
    {
        return $this->message;
    }

    /**
     * Sets message.
     *
     * @param string|null $message
     *
     * @return $this
     */
    public function setMessage(?string $message = null): self
    {
        $this->message = $message;

        return $this;
    }
}


